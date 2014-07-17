@echo off
echo Running dummy tailor
powershell -c echo $host
mkdir tmp\droplet\app

xcopy app tmp\droplet\app /s /e /i /h

mkdir tmp\cache
echo nop > tmp\cache\nop

mkdir tmp\result
echo|set /p={"buildpack_key":"52f71429-6589-44ef-bb5c-7e827a0a0af5_52808bb309461b2331e7996304af1be7d037a756", "detected_buildpack": "dummy-buildpack", "detected_start_command": "start"} > tmp\result\result.json
rem echo --- > tmp\result\staging_info.yml

exit /B 0
