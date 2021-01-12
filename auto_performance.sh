#!/usr/bin/env sh

export jmx_template="login"
export suffix=".jmx"
export jmx_template_filename="${jmx_template}${suffix}"
export os_type = `uname`

echo "Begin for performance testing ..."
thread_number_array=(10, 20, 30, 40)

for num in "${thread_number_array[@]}"
do
    # generate the jmx file
    export jmx_filename="${jmx_template}_${num}${suffix}"
    export jtl_filename="test_${num}.jtl"
    export web_report_filename="web_${num}"

    rm -f ${jmx_filename} ${jtl_filename}
    rm -rf ${web_report_filename}

    cp ${jmx_template_filename} ${jmx_filename}
    echo "generate the jmx file"

    if [["${os_type}" == "Darwin"]]; then
        sed -i "" "s/thread_num/${num}/g" ${jmx_filename}
    else
        sed -i "/s/thread_num/${num}/g" ${jmx_filename}
    fi

    # jmeter silently
    jmeter -n -t ${jmx_filename} -l ${jtl_filename}

    # generat the reprot
    jmeter -g ${jtl_filename} -e -o ${web_report_filename}

    rm -f ${jmx_filename} ${jtl_filename}
done
