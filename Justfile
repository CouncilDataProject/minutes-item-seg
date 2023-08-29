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
        seattle_test_spans_minutes_item_seg \
        blank:en \
        ./seattle.jsonl \
        --label MINUTES-BOUNDARY

# train prodigy model for seattle
train-prodigy-seattle:
    prodigy \
        train \
        --spancat seattle_test_spans_minutes_item_seg \
        --base-model en_core_web_sm \
        --label-stats \
        --verbose

# export seattle dataset
export-seattle:
    mkdir -p ./trial-datasets/
    prodigy \
        db-out \
        seattle_test_spans_minutes_item_seg > ./trial-datasets/seattle-test-spans-minutes-item-seg.jsonl