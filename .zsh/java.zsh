export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

# Maven needs lots of -err- everything
export MAVEN_OPTS='-Xms128m -Xmx512m'
function mvn() { /usr/local/bin/mvn $* | tee /tmp/last-mvn ; return $pipestatus[1] }
alias last-mvn='less +k /tmp/last-mvn'

