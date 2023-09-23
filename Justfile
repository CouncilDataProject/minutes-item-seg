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

# start prodigy for public comment multi-city dataset
run-prodigy-public-comment:
    prodigy \
        spans.manual \
        spans_public_comment_period_seg_multi_city_v0 \
        blank:en \
        ./public-comment-seg-multi-city.jsonl \
        --label FIRST-SENTENCE,LAST-SENTENCE

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

# train prodigy model for public comment
train-prodigy-public-comment:
    prodigy \
        train \
        --spancat spans_public_comment_period_seg_multi_city_v0 \
        --base-model en_core_web_sm \
        --label-stats \
        --verbose

# export public comment multi-city dataset
export-public-comment:
    prodigy \
        db-out \
        spans_public_comment_period_seg_multi_city_v0 > ./trial-datasets/seattle-public-comment-period-seg-v0.jsonl