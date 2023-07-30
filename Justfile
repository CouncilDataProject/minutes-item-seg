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
        textcat.teach \
        seattle_textcat_train_v0 \
        en_core_web_trf \
        ./seattle.jsonl \
        --label MINUTES-BOUNDARY,OTHER

# train prodigy model for seattle
train-prodigy-seattle:
    prodigy \
        train \
        --textcat seattle_textcat_train_v0 \
        --base-model en_core_web_trf \
        --label-stats \
        --verbose

# export seattle dataset
export-seattle:
    mkdir -p ./trial-datasets/
    prodigy \
        db-out \
        seattle_textcat_train_v0 > ./trial-datasets/seattle-textcat-train-v0.jsonl