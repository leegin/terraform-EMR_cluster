text_file = sc.textFile("s3://emr-spark/data/file.txt")
counts = text_file.flatMap(lambda line: line.split(" ")) \
             .map(lambda word: (word, 1)) \
             .reduceByKey(lambda a, b: a + b)
counts.write \
  .format("com.databricks.spark.redshift") \
  .option("url", "jdbc:redshift://Redshift-cluster:5439/red-db?user=reddbuser&password=reddbpassword123#") \
  .option("dbtable", "words-count") \
  .option("tempdir", "s3n://emr-spark/temp/data") \
  .mode("error") \
  .save()
