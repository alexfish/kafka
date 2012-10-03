#!/usr/bin/env ruby
 
require 'optparse'
require 'etc'
require 'tmpdir'
require 'fileutils'
require 'feedback'

TMP_DIR = "unfuddle2git"
TMP_PATH = "#{Dir.tmpdir}/#{TMP_DIR}"
SVN = `which svn`.strip

class Unfuddle2Git

  def initialize(args)
    @options = parse(args)
    @feedback = Feedback.new
    if @options[:valid] 
      start
    end
  end
  
  private 
  
  def start
    puts "Starting..."
    
    # get svn    
    generate_authors_txt(@options[:source])
    # run git svn clone
    git_svn_clone(@options[:source],@options[:destination])
    # generate git stuff
    generate_git_ignore(@options[:destination])
    generate_git_tags(@options[:destination])
    generate_git_branches(@options[:destination])
    
    puts "Finished!"
  end
  
  def parse(args)
    options = {}
    
    @opt_parser = OptionParser.new do |opt|
      opt.banner = "Usage: unfuddle2git COMMAND [OPTIONS]"
      opt.separator  ""
      opt.separator  "Commands"
      opt.separator  "     migrate: migrate an unfuddle svn repositry to git"
      opt.separator  ""
      opt.separator  "Options"
      
      
      opt.on("-s","--source SOURCE","the source svn repository url") do |source|
        options[:source] = source
      end
      opt.on("-u","--username USERNAME","the username to access the repository") do |username|
        options[:username] = username
      end
      opt.on("-d","--destination DESTINATION","the destination for the new git repository") do |destination|
        options[:destination] = destination
      end
      opt.on("-h","--help","help") do
        puts opt_parser
      end
    end
    
    @opt_parser.parse! args
    
    options[:valid] = true
    
    return validate_options(options)
  end

  def validate_options(options)
    case ARGV[0]
    when "migrate"
      if options[:source].nil?
        puts "Source URL required, see --help for more information"
        options[:valid] = false
      elsif options[:destination].nil?
        options[:destination] = "#{Etc.getpwuid.dir}/unfuddle2git"
        puts "No destination specified, using #{options[:destination]}"
      end
    else
      options[:valid] = false
      puts @opt_parser
    end
    options 
  end

  def generate_authors_txt(url)
    puts "Getting authors.."
    
    @feedback.display
    # do the svn checkout
    if @options[:username].nil?
      `cd #{Dir.tmpdir} && #{SVN} co #{url} #{TMP_DIR}`
    else
      `cd #{Dir.tmpdir} && #{SVN} co #{url} --username #{@options[:username]} #{TMP_DIR}`
    end
    @feedback.hide
    
    generate_authors_file
  end

  def generate_authors_file
   puts "Generating author file.."
   # move to svn repo folder & generate authors.txt
   `cd #{TMP_PATH} && #{SVN} log -q | awk -F '|' '/^r/ {sub("^ ", "", $2); sub(" $", "", $2); print $2" = "$2" <"$2">"}' | sort -u > authors-transform.txt` 
  end

  def git_svn_clone(url,destination)
    puts "Fetching repository and converting to git.."
    @feedback.display
    `cd #{TMP_PATH} && git svn clone #{url} --no-metadata -A authors-transform.txt --stdlayout #{destination} &>/dev/null`
    FileUtils.rm_rf(TMP_PATH)
    @feedback.hide
  end

  def generate_git_ignore(git_repo_path)
    puts "Generating .gitignore.."
    `cd #{git_repo_path} && git svn show-ignore > .gitignore &>/dev/null`
  end

  def generate_git_tags(git_repo_path)
    puts "Generating tags.."
    `cd #{git_repo_path} && git for-each-ref --format='%(refname)' refs/remotes/tags |
    cut -d / -f 4 |
    while read ref
    do
      git tag "$ref" "refs/remotes/tags/$ref";
      git branch -d -r tags/$ref;
    done `
  end

  def generate_git_branches(git_repo_path)
    puts "Generating branches.."
    `cd #{git_repo_path} && git for-each-ref --format='%(refname)' refs/remotes |
    cut -d / -f 3 |
    while read ref
    do
      if [ "$ref" != "trunk" ]
        then
          git branch $ref remotes/$ref;
      fi
    done`
  end
end