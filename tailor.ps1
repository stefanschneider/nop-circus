
$first_buildpack_key = ""

echo "Running nop tailor"

foreach ($arg in $script:args) {
  echo $arg
  if ($arg.StartsWith("-buildpackOrder")){
      $first_buildpack_key = $arg.TrimStart("-buildpackOrder=").Split(",")[0]
  }
}

mkdir -force tmp\droplet\app 

xcopy app tmp\droplet\app /s /e /i /h

mkdir -force tmp\cache
echo nop >> tmp\cache\nop

mkdir -force tmp\result

[System.IO.File]::WriteAllText("tmp\result\result.json", "{""buildpack_key"": ""$first_buildpack_key"", ""detected_buildpack"": ""dummy-buildpack"", ""detected_start_command"": ""start""}")
