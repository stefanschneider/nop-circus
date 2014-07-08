@echo off
echo Running dummy tailor
mkdir tmp\droplet\app

xcopy app tmp\droplet\app /s /e /i /h

mkdir tmp\result
echo {"detected_buildpack": "nop", "detected_start_command": ""} > tmp\result\result.json
rem echo --- > tmp\result\staging_info.yml

exit /B 0