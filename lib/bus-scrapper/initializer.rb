class Hash
  def method_missing(m, *args, &blk)
    fetch(m) { fetch(m.to_s) { super } }
  end
end

ROOT = File.expand_path File.join(File.dirname(__FILE__), '..', '..')
SITES = YAML.load_file("#{ROOT}/config/target-websites.yaml").to_h.websites
SECRETS = YAML.load_file("#{ROOT}/config/secrets.yaml").to_h
