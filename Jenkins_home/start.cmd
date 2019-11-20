cd /D %~dp0
chcp 65001
java  -Dfile.encoding=UTF-8 -jar agent.jar -jnlpUrl http://172.27.1.5:8080/computer/slave/slave-agent.jnlp -secret 453afbd22bac54474fec84c5cdb3b37e0398379842246ab75d731c9307feb1ca -workDir "C:\j"