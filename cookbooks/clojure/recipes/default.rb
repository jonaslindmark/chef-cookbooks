package "openjdk-7-jdk"

remote_file "/usr/sbin/lein" do
  source "https://raw.github.com/technomancy/leiningen/stable/bin/lein"
  mode "0755"
  not_if { File.exist?("/usr/sbin/lein") }
end
