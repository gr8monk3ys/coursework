import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

public class BigramDocumentIndexer {
    public static class BigramMapper extends Mapper<Object, Text, Text, Text> {
        private Text word = new Text();
        private Text documentID = new Text();
        private HashSet<String> bigrams = new HashSet<>(Arrays.asList(
            "computer science",
            "information retrieval",
            "power politics",
            "los angeles",
            "bruce willis"
        ));

        @Override
        public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
            String[] documentTextArray = value.toString().split("\t", 2);
            documentID.set(documentTextArray[0]);

            String text = documentTextArray[1].toLowerCase().replaceAll("[^a-zA-Z ]+", " ").trim();
            List<String> words = Arrays.asList(text.split("\\s+"));
            for (int i = 0; i < words.size() - 1; i++) {
                String bigram = words.get(i) + " " + words.get(i + 1);
                if (bigrams.contains(bigram)) {
                    word.set(bigram);
                    context.write(word, documentID);
                }
            }
        }
    }

    public static class BigramReducer extends Reducer<Text, Text, Text, Text> {
        @Override
        public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
            HashMap<String, Integer> documentFrequencies = new HashMap<>();
            values.forEach(docID -> documentFrequencies.merge(docID.toString(), 1, Integer::sum));

            String aggregatedDocuments = documentFrequencies.entrySet().stream()
                    .map(entry -> entry.getKey() + ":" + entry.getValue())
                    .collect(Collectors.joining(" "));
            context.write(key, new Text(aggregatedDocuments));
        }
    }

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf, "bigram indexer");

        job.setJarByClass(BigramDocumentIndexer.class);
        job.setMapperClass(BigramMapper.class);
        job.setReducerClass(BigramReducer.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(Text.class);

        FileInputFormat.addInputPath(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));

        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}
