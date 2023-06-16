# list all available commands
default:
    just --list

# install basic deps
install:
    pip install --upgrade -r requirements.txt
    @ echo "\n!! Be sure to install prodigy as well! !!"

# start prodigy for seattle
run-prodigy-seattle:
    prodigy \
        spans.manual \
        seattle_test_dataset_minutes_item_seg \
        blank:en \
        ./seattle.jsonl \
        --label MINUTES-BOUNDARY