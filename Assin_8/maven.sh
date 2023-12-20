#!/bin/bash

function gen_articraft(){
echo "compiling the project"
mvn compile
echo "now we are testing the compiled code"
mvn test 
echo "now generating artifact"
mvn package
echo "your artifact is ready hurrryay!"


}

function install_art(){

    mvn clean install
    if [[ $? -eq 0 ]];then
    echo "your articarft is successfully uploaded to your local repo"
    else
    echo "soory there might be an issue try to fix it"
    fi
}

function unit_test() {
  if [ "$OPTARG" == "html" ]; then
    mvn surefire-report:report -DreportType=html
    echo " Now generating CODE COVERAGE STATUS"
    mvn jacoco:report-aggregate jacoco:report-aggregate -DdataFile=target/jacoco.exec -DoutputDirectory=target/jacoco-aggregate-csv -DoutputType=html

  elif [ "$OPTARG" == "xml" ]; then
    mvn surefire-report:report -DreportType=xml
     echo " Now generating CODE COVERAGE STATUS"
    mvn jacoco:report-aggregate jacoco:report-aggregate -DdataFile=target/jacoco.exec -DoutputDirectory=target/jacoco-aggregate-csv -DoutputType=xml

  elif [ "$OPTARG" == "csv" ]; then
    mvn surefire-report:report -DreportType=csv
    echo " Now generating CODE COVERAGE STATUS"
    mvn jacoco:report-aggregate jacoco:report-aggregate -DdataFile=target/jacoco.exec -DoutputDirectory=target/jacoco-aggregate-csv -DoutputType=csv

  else
    echo "Invalid option. Use 'html,xml,csv' as an argument."
  fi
}


function deploy(){

mvn deploy 
 echo "we are going to deploy your file on TOMCAT server from EC2"
 sudo cp target/Spring3HibernateApp.war /var/lib/tomcat9/webapps

}


perform_static_analysis() {
    case $1 in
        "checkstyle")
            mvn checkstyle:check
            ;;
        "findbugs")
            mvn findbugs:check
            ;;
        "pmd")
            mvn pmd:check
            ;;
        *)
            echo "Invalid static analysis tool specified."
            display_usage
            ;;
    esac
}

while getopts ":aids:t:" opt; do
  case $opt in
    a)
      gen_articraft
      ;;
    i)
      install_art
      ;;
    s)
      perform_static_analysis "$OPTARG"
      ;;
    t)
      unit_test "$OPTARG"
      ;;
    d)
      ;;
    
      
    \?)
      echo "Invalid option: -$OPTARG"
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument."
      exit 1
      ;;
  esac
done
