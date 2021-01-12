# iTest_performance
focused on the performance testing for web environment

## JMeter Silent

if run the JMeter without the GUI, you can run it in the command line using the following:

```
jmeter –n –t $jmx_file -l $jtl_file -j $result.log
```

- `jmx_file`: the origin file with suffix `.jmx`
- `jtl_file` : the generated files and can be used to general the html report

## Generate HTML Report

if generate the html report , you can run the following command:

```
jmeter -g $jtl_file -o $report_html
```