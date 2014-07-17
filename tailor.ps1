$first_buildpack_key = ""

foreach ($arg in $script:args) {
  Write-OUtput $arg
  if ($arg.StartsWith("-buildpackOrder")){
      $first_buildpack_key = $arg.TrimStart("-buildpackOrder=").Split(",")[0]
  }
}

Write-Host "Running nop tailor"
mkdir -force tmp\droplet\app > out-null

xcopy app tmp\droplet\app /s /e /i /h

mkdir -force tmp\cache > out-null
echo nop >> tmp\cache\nop

mkdir -force tmp\result > out-null

Write-Output "{""buildpack_key"": ""$first_buildpack_key"", ""detected_buildpack"": ""dummy-buildpack"", ""detected_start_command"": ""start""}" > tmp\result\result.json
