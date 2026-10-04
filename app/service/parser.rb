class Parser
  class InvalidLog < StandardError; end

  CLI_PATH = Rails.root.join("parser", "GuildWars2EliteInsights-CLI.exe")
  CONFIG_PATH = Rails.root.join("parser", "Settings", "config.conf")

  def self.call(file)
    new(file).call
  end

  def initialize(file)
    @file = file
  end

  def call
    validate!

    parse_log
  end

  private

  def validate!
    raise InvalidLog, "Please select a log file." unless @file.present?
  end

  def parse_log
    dir = FileUtils.mkdir_p(@file.original_filename)
    output_dir = File.join(dir, "output")
    config_path = File.join(dir, "config.conf")

    FileUtils.mkdir_p(output_dir)

    create_config(config_path, output_dir)

    run_elite_insights(output_dir, config_path)
  end

  def run_elite_insights(output_dir, config_path)
    stdout, stderror, status = Open3.capture3(
      CLI_PATH.to_s,
      "-c",
      config_path,
      @file.path
    )

    unless status.success?
      raise InvalidLog stderror.presence || "Elite Insight failed"
    end

    json = stdout[/\{.*\}/m]

    puts "************asdfg*******"
    puts json
    puts "*******************"
    raise InvalidLog, "Elite Insights did not return JSON" unless json

    result = JSON.parse(json)

    unless result["parsed"]
      raise InvalidLog, result["status"] || "Elite Insight could not parse log"
    end

    json_file = Dir.glob("#{output_dir}/*.json").first

    puts "************qwerty*******"
    puts json_file
    puts "*******************"

    unless json_file
      raise InvalidLog, "Elite Insight did not create a log"
    end

    JSON.parse(File.read(json_file))
  end

  def create_config(config_path, output_dir)
    config = File.read(CONFIG_PATH)
    config << "\nOutLocation=./#{output_dir}\n"
    File.write(config_path, config)
  end
end
