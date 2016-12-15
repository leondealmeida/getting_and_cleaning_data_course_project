# Code Book


## About the Dataset

The dataset comprises a list of 66 averages for means and standard deviations of the measurements originally in the UCI HAR Dataset. The variables kept are the ones that explicitly mentiond either `std()` or `mean()` (case sensitive) on their original labels. The labels were expanded from their originals to make them more explicit and improve readability, though there is still some domain knowledge required for the data to be useful. _Mean_ was added as a prefix to all of the calculated variables in the final tidy dataset to differentiate from the original data's labels and explictly demonstrate what transformation has been applied.

Both _train_ and _test_ datasets were merged. `SubjectId` and `ActivityType` were used as keys for grouping the dataset to enable the calculation of the averages. There is a total of 180 uniquely identifiable observations, for 30 different test subjects and 6 distinct activities. There are other 66 different variables, and their source values from the original dataset were normalized between 0 and 1.

The `ActivityType` was derived from the activity labels available on the original dataset.

All numeric values apart from the `SubjectId` are floating point numbers.


## Variables Names

_Observation unique identifiers_
- `SubjectId`: integer (ranges from 1 to 30)
    - Identifies the participant


- `ActivityType`: string
    - Identifies the activity measured on the observation. Possible values: `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, and `LAYING`

_Time domain values over individual axes_
- `MeanTimeBodyAccelerometerMeanX`, `MeanTimeBodyAccelerometerMeanY`, `MeanTimeBodyAccelerometerMeanZ`: double
    - Mean for the body linear acceleration mean values over the X, Y, and Z axes over time, respectively

- `MeanTimeBodyAccelerometerStandardDeviationX`, `MeanTimeBodyAccelerometerStandardDeviationY`, `MeanTimeBodyAccelerometerStandardDeviationZ`: double
    - Mean for the body linear acceleration stand deviation values over the X, Y, and Z axes over time, respectively

- `MeanTimeGravityAccelerometerMeanX`, `MeanTimeGravityAccelerometerMeanY`, `MeanTimeGravityAccelerometerMeanZ`: double
    - Mean for the gravity acceleration mean values over the X, Y, and Z axes over time, respectively

- `MeanTimeGravityAccelerometerStandardDeviationX`, `MeanTimeGravityAccelerometerStandardDeviationY`, `MeanTimeGravityAccelerometerStandardDeviationZ`: double
    - Mean for the gravity acceleration standard deviation values over the X, Y, and Z axes over time, respectively

- `MeanTimeBodyAccelerometerJerkMeanX`, `MeanTimeBodyAccelerometerJerkMeanY`, `MeanTimeBodyAccelerometerJerkMeanZ`: double
    - Mean for the body Jerk signals mean values over the X, Y, and Z axes over time, respectively

- `MeanTimeBodyAccelerometerJerkStandardDeviationX`, `MeanTimeBodyAccelerometerJerkStandardDeviationY`, `MeanTimeBodyAccelerometerJerkStandardDeviationZ`: double
    - Mean for the body Jerk signals standard deviation values over the X, Y, and Z axes over time, respectively

- `MeanTimeBodyGyroscopeMeanX`, `MeanTimeBodyGyroscopeMeanY`, `MeanTimeBodyGyroscopeMeanZ`: double
    - Mean for the body gyroscopic signal mean values over the X, Y, and Z axes over time, respectively

- `MeanTimeBodyGyroscopeStandardDeviationX`, `MeanTimeBodyGyroscopeStandardDeviationY`, `MeanTimeBodyGyroscopeStandardDeviationZ`: double
    - Mean for the body gyroscopic signal standard deviation values over the X, Y, and Z axes over time, respectively

- `MeanTimeBodyGyroscopeJerkMeanX`, `MeanTimeBodyGyroscopeJerkMeanY`, `MeanTimeBodyGyroscopeJerkMeanZ`: double
    - Mean for the body gyroscopic Jerk signal mean values over the X, Y, and Z axes over time, respectively

- `MeanTimeBodyGyroscopeJerkStandardDeviationX`, `MeanTimeBodyGyroscopeJerkStandardDeviationY`, `MeanTimeBodyGyroscopeJerkStandardDeviationZ`: double
    - Mean for the body gyroscopic Jerk signal standard deviation values over the X, Y, and Z axes over time, respectively

_Time domain three-dimensional magnitudes calculated by Euclidean norm_
- `MeanTimeBodyAccelerometerMagnitudeMean`: double
    - Mean of the magnitude of the mean values over time for the three-dimensional accelerometer signals for the body

- `MeanTimeBodyAccelerometerMagnitudeStandardDeviation`: double
    - Mean of the magnitude of the standard deviation values over time for the three-dimensional accelerometer signals for the body

- `MeanTimeGravityAccelerometerMagnitudeMean`: double
    - Mean of the magnitude of the mean values over time for the three-dimensional accelerometer signals for gravity

- `MeanTimeGravityAccelerometerMagnitudeStandardDeviation`: double
    - Mean of the magnitude of the standard deviations values over time for the three-dimensional accelerometer signals for gravity

- `MeanTimeBodyAccelerometerJerkMagnitudeMean`: double
    - Mean of the magnitude of the mean values over time for the three-dimensional accelerometer signals for body Jerk

- `MeanTimeBodyAccelerometerJerkMagnitudeStandardDeviation`: double
    - Mean of the magnitude of the standard deviation values over time for the three-dimensional accelerometer signals for body Jerk

- `MeanTimeBodyGyroscopeMagnitudeMean`: double
    - Mean of the magnitude of the mean values over time for the three-dimensional gyroscope signals for the body

- `MeanTimeBodyGyroscopeMagnitudeStandardDeviation`: double
    - Mean of the magnitude of the standard deviation values over time for the three-dimensional gyroscope signals for the body

- `MeanTimeBodyGyroscopeJerkMagnitudeMean`: double
    - Mean of the magnitude of the mean values over time for the three-dimensional gyroscope signals for body Jerk

- `MeanTimeBodyGyroscopeJerkMagnitudeStandardDeviation`: double
    - Mean of the magnitude of the standard deviation values over time for the three-dimensional gyroscope signals for body Jerk

_FFT-generated frequency domain values over individual axes_
- `MeanFrequencyBodyAccelerometerMeanX`, `MeanFrequencyBodyAccelerometerMeanY`, `MeanFrequencyBodyAccelerometerMeanZ`: double
    - Mean for the body linear acceleration mean values frequency over the X, Y, and Z axes, respectively

- `MeanFrequencyBodyAccelerometerStandardDeviationX`, `MeanFrequencyBodyAccelerometerStandardDeviationY`, `MeanFrequencyBodyAccelerometerStandardDeviationZ`: double
    - Mean for the body linear acceleration standard deviation values frequency over the X, Y, and Z axes, respectively

- `MeanFrequencyBodyAccelerometerJerkMeanX`, `MeanFrequencyBodyAccelerometerJerkMeanY`, `MeanFrequencyBodyAccelerometerJerkMeanZ`: double
    - Mean for the body linear acceleration mean values frequency over the X, Y, and Z axes, respectively for body Jerk

- `MeanFrequencyBodyAccelerometerJerkStandardDeviationX`, `MeanFrequencyBodyAccelerometerJerkStandardDeviationY`, `MeanFrequencyBodyAccelerometerJerkStandardDeviationZ`: double
    - Mean for the body linear acceleration standard deviation values frequency over the X, Y, and Z axes, respectively for body Jerk

- `MeanFrequencyBodyGyroscopeMeanX`, `MeanFrequencyBodyGyroscopeMeanY`, `MeanFrequencyBodyGyroscopeMeanZ`: double
    - Mean for the body gyroscopic signal mean values frequency over the X, Y, and Z axes, respectively

- `MeanFrequencyBodyGyroscopeStandardDeviationX`, `MeanFrequencyBodyGyroscopeStandardDeviationY`, `MeanFrequencyBodyGyroscopeStandardDeviationZ`: double
    - Mean for the body gyroscopic signal standard deviation values frequency over the X, Y, and Z axes, respectively

_Frequency domain three-dimensional magnitudes_
- `MeanFrequencyBodyAccelerometerMagnitudeMean`: double
    - Mean of the magnitude of the mean values frequency for the three-dimensional accelerometer signals for the body

- `MeanFrequencyBodyAccelerometerMagnitudeStandardDeviation`: double
    - Mean of the magnitude of the standard deviation values frequency for the three-dimensional accelerometer signals for the body

- `MeanFrequencyBodyAccelerometerJerkMagnitudeMean`: double
    - Mean of the magnitude of the mean values frequency for the three-dimensional accelerometer signals for body Jerk

- `MeanFrequencyBodyAccelerometerJerkMagnitudeStandardDeviation`: double
    - Mean of the magnitude of the standard deviation values frequency for the three-dimensional accelerometer signals for body Jerk

- `MeanFrequencyBodyGyroscopeMagnitudeMean`: double
    - Mean of the magnitude of the mean values frequency for the three-dimensional gyroscope signals for the body

- `MeanFrequencyBodyGyroscopeMagnitudeStandardDeviation`: double
    - Mean of the magnitude of the standard deviation values frequency for the three-dimensional gyroscope signals for the body

- `MeanFrequencyBodyGyroscopeJerkMagnitudeMean`: double
    - Mean of the magnitude of the mean values frequency for the three-dimensional gyroscope signals for body Jerk

- `MeanFrequencyBodyGyroscopeJerkMagnitudeStandardDeviation`: double
    - Mean of the magnitude of the standard deviation values frequency for the three-dimensional gyroscope signals for the body