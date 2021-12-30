package org.example;

import com.beust.jcommander.JCommander;
import com.beust.jcommander.ParameterException;
import com.beust.jcommander.UnixStyleUsageFormatter;
import org.apache.kafka.clients.producer.*;
import com.beust.jcommander.Parameter;
import org.apache.kafka.common.header.Headers;
import org.apache.kafka.common.header.internals.RecordHeaders;

import java.text.DecimalFormat;
import java.util.Properties;

public class kafkahw {
    public static void testProducer(Producer producer, Argument argument) {
        int i = 1;
        String s="";
        Headers headers = new RecordHeaders();
        for (int j=1;j<= Integer.parseInt(argument.recordSize)/2;j++)
            if (j>95/2)
                s+="0";

        headers.add(s,s.getBytes());
        while (i <= Integer.parseInt(argument.records)) {
            producer.send(
                    new ProducerRecord(argument.topic,null
                            , "key-"+new DecimalFormat("000000").format(i)
                            , "value-" + new DecimalFormat("000000").format(i),headers));
            i++;
        }
        producer.close();
    }
    public static void main(String[] args){
        var a=new Argument();
        JCommander jc = JCommander.newBuilder().addObject(a).build();
        jc.setUsageFormatter(new UnixStyleUsageFormatter(jc));
        try {
            jc.parse(args);
        } catch (ParameterException pe) {
            var sb = new StringBuilder();
            jc.getUsageFormatter().usage(sb);
            throw new ParameterException(pe.getMessage() + "\n" + sb);
        }
        Properties props = new Properties();
        props.put("bootstrap.servers", a.broker);
        props.put("batch.size", 10000);
        props.put("buffer.memory", 10000*10000);
        props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
        props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");
        Producer producer = new KafkaProducer(props);
        testProducer(producer, a);
    }
    static class Argument{
        @Parameter(
                names = {"--brokers"},
                required = true)
        public String broker;
        @Parameter(
                names = {"--topic"},
                required = true)
        public String topic;
        @Parameter(
                names = {"--records"},
                required = true)
        public String records;
        @Parameter(
                names = {"--recordSize"},
                required = true)
        public String recordSize;
    }

}
