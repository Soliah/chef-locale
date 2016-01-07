#
# Cookbook Name:: locale
# Recipe:: default
#

lang = node["locale"]["lang"]
lc_all = node["locale"]["lc_all"]

package "locales" do
  action :install
end

execute "Update locale" do
  command "update-locale LANG=#{lang} LC_ALL=#{lc_all}"
  action :nothing
end

execute "Generate locale" do
  command "locale-gen #{lang} #{lc_all}"
  not_if {
    if File.exists?("/etc/default/locale")
      locale = File.read("/etc/default/locale")
      locale.include?("LANG=#{lang}") && locale.include?("LC_ALL=#{lc_all}")
    else
      false
    end
  }

  notifies :run, "execute[Update locale]"
end
