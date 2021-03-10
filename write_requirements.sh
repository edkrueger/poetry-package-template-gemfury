FAILED=false

# requirements
NEW_REQUIREMENTS=$(poetry export -f requirements.txt --without-hashes)

if [ -f requirements.txt ]; then
    echo "requirements.txt exists!"
else
    echo "FAILURE: requirements.txt does not exist!"
    poetry export --format requirements.txt --output requirements.txt --without-hashes
    FAILED=True
fi

REQUIREMENTS=$(cat requirements.txt)

if [ "$NEW_REQUIREMENTS" = "$REQUIREMENTS" ]; then
    echo "requirements.txt is up to date!"
else
    echo "FAILURE: requirements.txt is not up to date!"
    poetry export --format requirements.txt --output requirements.txt --without-hashes
    FAILED=True
fi

# dev requirements
NEW_REQUIREMENTS_DEV=$(poetry export --format requirements.txt --without-hashes --dev)

if [ -f requirements-dev.txt ]; then
    echo "requirements-dev.txt exists!"
else
    echo "FAILURE: requirements-dev.txt does not exist!"
    poetry export --format requirements.txt --output requirements-dev.txt --without-hashes --dev
    FAILED=True
fi

REQUIREMENTS_DEV=$(cat requirements-dev.txt)

if [ "$NEW_REQUIREMENTS_DEV" = "$REQUIREMENTS_DEV" ]; then
    echo "requirements-dev.txt is up to date!"
else
    echo "FAILURE: requirements-dev.txt is not up to date!"
    poetry export --format requirements.txt --output requirements-dev.txt --without-hashes --dev
    FAILED=true
fi

if [ "$FAILED" = true ]; then
    exit 1
fi
exit 0
