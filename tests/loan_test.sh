check_appium_status() {
    appium_status=$(curl -s "http://localhost:4723/status")
    ready=$(echo "$appium_status" | jq -r '.value.ready')
    echo "$ready"
}

ready=$(check_appium_status)

if [ "$ready" = "true" ]; then
    echo "✅ Appium server is already running."
else
    echo "⚠️ Appium server not running or not ready. Starting now..."

    brew services start appium

    while true; do
        ready=$(check_appium_status)
        if [ "$ready" = "true" ]; then
            echo "✅ Appium server is already running."
            break
        else
            echo "⚠️ Appium server not ready yet. Retrying in 3 seconds..."
            sleep 3
        fi
    done

    echo "🚀 Appium server started in background"
fi

poetry run robot --outputdir "tests/loan" tests/loan/loan_test.robot
sleep 3
open "$PWD/tests/loan/log.html"
