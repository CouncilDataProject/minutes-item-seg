# Minutes Item Segmentation

Segmenting meeting transcripts using boundary classification.

## General Idea

Council meetings are highly structured and when moving from one discussion item
to another, their is usually a very clear identifiable boundary between the two.

Because these are identifiable, we can hopefully train a text classification or
span categorization model to identify them for us.

## Tasks

* [ ] Annotate small portion of data to start
  * Eva is working on Seattle events
  * Sung is working on Denver events
  * {Place your name and what municipality you are working on here}
* [ ] Train model to get early idea of how much annotated data is needed
* [ ] Annotate more data as needed
* [ ] Train "final" model
* [ ] Implement the model into the cdp-backend event pipeline
* [ ] Use the outputs of the model on the cdp-frontend web app

## Getting Setup

### Installation

Installing dependencies: `just install`

⚠️⚠️ This WILL NOT install Prodigy, you will need to install that afterwards. ⚠️⚠️

It is generally recommended to make a new environment just for prodigy so that
it is isolated from all other work and you don't need to reinstall it.

### Dataset Construction

If you are creating on a new dataset to annotate, make a new code cell in the
[construct-dataset.ipynb Notebook](./construct-dataset.ipynb) and copy what you need
from the existing cells.

### Annotation

The [Justfile](./Justfile) has the command for starting annotation for the Seattle
annotation set, feel free to add a new command for your own annotation set.
