require "serverspec"

set :backend, :exec

describe "locale::default" do
  describe package("locales"), if: os[:family] == "ubuntu" do
    it { is_expected.to be_installed }
  end

  describe file("/etc/sysconfig/i18n"), if: %w(redhat entos fedora).include?(os[:family]) do
    its(:content) { is_expected.to contain("LANG=en_AU.utf8") }
    its(:content) { is_expected.to contain("LC_ALL=en_AU.utf8") }
  end
end
