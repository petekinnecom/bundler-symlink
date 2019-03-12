## Symlink your bundled gems

This gem adds a Bundler hook to automatically add a symlink to each gem
in the `.bundle/gems/` directory in your project. It also adds a command
to run `bundle symlink` if you prefer to run it manually.

## Installation

Install the gem:

`gem install bundler-symlink`

Register the plugin with Bundler:

Globally:

`cd ~ &&  bundler plugin install bundler-symlink`

Per project:

`cd /path/to/project && bundler plugin install bundler-symlink`


## Uninstall

If it's your only plugin, remove the plugin file from whichever
directory you installed it:

`rm .bundle/plugin/index`

If you have other plugins, edit `.bundle/plugin/index` and remove
relevant entries.

## Why?

Installing gems into a global shared path can be a bummer:

- How to navigate around gems in your editor?
- How to find definition of functions?
- How to use your CLI tools to work with your bundled gems?

Installing your bundle into your project's directory has some advantages:

- Navigate your gems in your editor of choice
- "Go To Definition" support in your editor out of the box
- Use your favorite command line tools to search your gems
- Easily add debugging statements to gems to see what is going on

Installing locally also has some downsides:

- Install the same gem in lots of different locations on your drive
- Wait for gems to compile native extensions over and over again

Get all the upsides without the downsides by creating a directory that
with symlinks to the installation path of each gem in your bundle.


Example:

```
: ls .bundle/gems/ | head
total 0
drwxr-xr-x  430 pete  staff    13K Mar 12 13:35 .
drwxr-xr-x    4 pete  staff   128B Mar 12 13:35 ..
lrwxr-xr-x    1 pete  staff    80B Mar 12 13:35 actioncable-5.2.1 -> /Users/pete/.rbenv/versions/2.3.3/lib/ruby/gems/2.3.0/gems/actioncable-5.2.1
lrwxr-xr-x    1 pete  staff    81B Mar 12 13:35 actionmailer-5.2.1 -> /Users/pete/.rbenv/versions/2.3.3/lib/ruby/gems/2.3.0/gems/actionmailer-5.2.1
lrwxr-xr-x    1 pete  staff    79B Mar 12 13:35 actionpack-5.2.1 -> /Users/pete/.rbenv/versions/2.3.3/lib/ruby/gems/2.3.0/gems/actionpack-5.2.1
lrwxr-xr-x    1 pete  staff    90B Mar 12 13:35 actionpack-xml_parser-2.0.1 -> /Users/pete/.rbenv/versions/2.3.3/lib/ruby/gems/2.3.0/gems/actionpack-xml_parser-2.0.1
```

Awesome.

### License

WTFPL : http://www.wtfpl.net/txt/copying/
