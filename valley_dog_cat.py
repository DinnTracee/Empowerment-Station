import pandas as pd 
import numpy as np

import matplotlib.pyplot as plt

from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split

# Read in data file
df = pd.read_csv('data/empowerment_station.csv')

# Features to be considered
features = ['family_income', 'education_level', 'experience', 'location', 'employment_status', 'interest_in_empowerment']

# Define target label
label = 'empowered'

# Split data into training and test sets
X_train, X_test, y_train, y_test = train_test_split(df[features], df[label])

# Create a random forest classifier
clf = RandomForestClassifier(random_state=42)

# Fit the model
clf.fit(X_train, y_train)

# Make predictions
preds = clf.predict(X_test)

# Measure performance
accuracy_score = clf.score(X_test, y_test)

# Print performance score
print("Model Accuracy Score: %.2f%%" % (accuracy_score*100))

# Feature importance
feature_importances = pd.DataFrame(clf.feature_importances_,
                                   index = X_train.columns,
                                    columns=['importance']).sort_values('importance', ascending=False)

print(feature_importances)

# Visualise feature importances
plt.figure(figsize=(8, 8))

plt.barh(np.arange(len(feature_importances)), feature_importances.importance, align='center', alpha=0.8) 
plt.yticks(np.arange(len(feature_importances)), feature_importances.index) 
plt.xlabel('Feature Importance')
plt.title('Feature Importance of Empowerment Station Model')

plt.show()

# Hyperparameter tuning

# Parameters to tune
parameters = {
    'n_estimators': [10, 50, 100],
    'max_depth': [None, 5, 10, 15],
    'min_samples_split': [5, 10, 15],
    'min_samples_leaf': [1, 2, 5]
}

# Use RandomizedSearchCV to find the best parameters
from sklearn.model_selection import RandomizedSearchCV

# Create the random search model
random_search = RandomizedSearchCV(clf, param_distributions = parameters, cv=5, verbose=2, n_jobs=-1, random_state=42)

# Fit the search
random_search.fit(X_train, y_train);

# Print the best parameters
print("Best Parameters: ", random_search.best_params_)

# Use the best parameters to create a new classifier
clf_tuned = RandomForestClassifier(**random_search.best_params_)

# Fit the new model
clf_tuned.fit(X_train, y_train)

# Evaluate the model
accuracy_score_tuned = clf_tuned.score(X_test, y_test)

# Print performance score
print("Model Accuracy Score (Tuned): %.2f%%" % (accuracy_score_tuned*100))