pipeline {
    agent { node { label 'bc-yherar' } }
    
    stages("manifest"){
        stage {
                def props = readJSON file: 'manifest.json'
                assert props['attr1'] == 'One'
                assert props.attr1 == 'One'
              }       
            }
          }
