# MachineLearningHoods

Uses [AWS Machine Learning](https://aws.amazon.com/machine-learning/) to predict
which neighborhood a string of text most likely originates from.

## How

- Using a dataset of ~1G of geo-tagged tweets, we create a CSV with two columns: text and neighborhood.
- After training and evaluating a model with this data, we expose the real-time endpoint via this elixir application.

## Takeaways

- Molding the training data to create a better model is the real challenge here.
- Does my data even have statistical correlations or is it just noise?
- Iterate, iterate, iterate on the model and evaluation data is what it seems people do.

![Prediction Matrix](https://raw.githubusercontent.com/dimroc/machine_learning_hoods/master/web/static/assets/images/PredictionMatrix.jpg)
![Neighborhood Categories](https://raw.githubusercontent.com/dimroc/machine_learning_hoods/master/web/static/assets/images/NeighborhoodCategories.jpg)

### Input Schema

```json
{
  "version": "1.0",
    "rowId": null,
    "rowWeight": null,
    "targetAttributeName": "Neighborhood",
    "dataFormat": "CSV",
    "dataFileContainsHeader": true,
    "attributes": [
    {
      "attributeName": "Text",
      "attributeType": "TEXT"
    },
    {
      "attributeName": "Neighborhood",
      "attributeType": "CATEGORICAL"
    }
    ],
    "excludedAttributeNames": []
}
```

