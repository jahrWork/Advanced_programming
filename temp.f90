def load_matrix( filename ): 

     
    data = pd.read_csv(filename)

  # header 
    columns = data.columns.tolist()
    print(" header =", columns)

    return data.values 
