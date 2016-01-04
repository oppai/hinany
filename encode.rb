require 'mediakit'
require 'optparse'

params = ARGV.getopts('','input:','output:')

driver = Mediakit::Drivers::FFmpeg.new()
ffmpeg = Mediakit::FFmpeg.new(driver)

options = Mediakit::FFmpeg::Options.new
options.add_option(Mediakit::FFmpeg::Options::GlobalOption.new('t' => 100))
options.add_option(Mediakit::FFmpeg::Options::InputFileOption.new(options: nil, path: params['input']))
options.add_option(
    Mediakit::FFmpeg::Options::OutputFileOption.new(
      options: {
        'ar' => '44100',
        'ab' => '128k',
      },
      path: params['output'],
    )
)
puts "$ #{ffmpeg.command(options)}"
puts ffmpeg.run(options, timeout: 30, nice: 0)
