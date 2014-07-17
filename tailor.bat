@echo off
echo Running dummy tailor
mkdir tmp\droplet\app

xcopy app tmp\droplet\app /s /e /i /h

mkdir tmp\cache
echo nop > tmp\cache\nop

mkdir tmp\result
echo|set /p={"detected_buildpack": "dummy-buildpack", "detected_start_command": "start"} > tmp\result\result.json
rem echo --- > tmp\result\staging_info.yml

exit /B 0
