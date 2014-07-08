@echo off
echo Running dummy tailor
mkdir tmp\droplet\app

xcopy app tmp\droplet\app /s /e /i /h

mkdir tmp\result
echo {"detected_buildpack": "dummy-buildpack", "detected_start_command": "start"} > tmp\result\result.json
rem echo --- > tmp\result\staging_info.yml

exit /B 0