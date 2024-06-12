import numpy as np
import matplotlib.pyplot as plt


def std_dev_calc(*sample_values):
    """Calculates the standard deviation

    Args:
        sample_values (int): Takes multiple sample_values from population

    Returns:
        values (float): The standard deviation of sample_values
    """
    if len(sample_values) == 0:
        raise ValueError("At least two sample values are required")
    std_dev = np.std(sample_values)
    return std_dev

# Example Use
sample_data = [1, 5, 10, 230, 490, 768, 1000, 3800, 6980]
result = round(std_dev_calc(sample_data), 3)
print("The standard deviation is:", result)

# Plotting the values
plt.hist(sample_data, bins=2, color="orange", edgecolor="black")
plt.title("Standard Distribution of Sample Values")
plt.xlabel("Values")
plt.ylabel("Occurrences")
plt.show()
