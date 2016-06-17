require "serverspec"
require "docker"

describe "Docker Image" do
  imagename = ENV['TEST_IMAGE']
  image = Docker::Image.create('fromImage' => imagename)

  set :os, family: :redhat
  set :backend, :docker
  set :docker_image, image.id
  describe imagename do
    def os_version
      command("cat /etc/redhat-release").stdout
    end
    it "is RHEL 7" do
      expect(os_version).to include("release 7")
    end
  end
end
