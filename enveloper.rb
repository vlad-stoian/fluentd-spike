require 'json'

begin
  STDOUT.sync = true
  
  while line = STDIN.gets # continue to read a event from stdin
    line.chomp!

    # Input format depends on exec_filter's in_format setting
    input_json = JSON.parse(line)

    # main processing. You can do anything, mutate record, access to database and etc.

    enveloped_json = {
      'envelope' => {
        "product_version" => "1.2.3",
        "cloud_provider" => "GCP",
        "vcenter_id" => "1234-abcd"
      },
      'payload' => input_json
    }

    # Write data to stdout. Output format depends on exec_filter's out_format setting
    STDOUT.print JSON.dump(enveloped_json)

    # Call flush to avoid buffering events
    STDOUT.flush
  end
rescue Interrupt # Ignore Interrupt exception because it happens during exec_filter shutdown
end
