desc "Update pot/po files."
task :updatepo do
  require 'gettext/utils'  #HERE!
  GetText.update_pofiles("tmpfiles", Dir.glob("{app,lib,bin}/**/*.{rb,erb,rjs}"), "tmpfiles 1.0.0")
end

desc "Create mo-files"
task :makemo do
  require 'gettext/utils'  #HERE!
  GetText.create_mofiles(true, "po", "locale")
end