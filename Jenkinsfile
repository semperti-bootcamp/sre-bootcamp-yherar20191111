pipeline {
    agent { node { label 'bc-yherar' } }
    
    stage("checkout"){

    def props = readJSON file: 'manifest.json'
    assert props['attr1'] == 'One'
    assert props.attr1 == 'One'

 }
}
