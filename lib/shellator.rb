require "shellator/version"

require "open3"

module Shellator
  def self.noninteractive(cmd, in_directory: nil, stdin_content: [], stdout:, stderr:)
    raise "cmd must be a String or array of Strings." \
      unless cmd.is_a?(String) || (cmd.is_a?(Array) && cmd.all? { |c| c.is_a?(Stirng) })
    raise "stdout must be a Proc." unless stdout.is_a?(Proc)
    raise "stderr must be a Proc." unless stderr.is_a?(Proc)

    stdin_content = [stdin_content].flatten
    raise "stdin_content must be an Array of Strings." \
      unless stdin_content.is_a?(Array) && stdin_content.all? { |c| c.is_a?(String) }

    computed_cmd = [cmd].flatten.join(" ")

    Dir.chdir(in_directory || Dir.pwd) do
      Open3.popen3(computed_cmd) do |stdin_stream, stdout_stream, stderr_stream, thread|
        stdin_content.each do |input_line|
          stdin_stream.write(input_line)
        end

        { stdout_stream => stdout, stderr_stream => stderr }.each_pair do |stream, callback|
          Thread.new do
            until (line = stream.gets).nil?
              callback.call(line)
            end
          end
        end

        thread.join
        thread.value
      end
    end
  end
end
