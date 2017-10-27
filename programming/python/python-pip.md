# 计算机、Python、Pip 三者之间的关系
此文以 Ubuntu 为例

## Python 多个版本并存的状态

常见的 Python 版本有 2.7、3.0、3.5 等，但是一般情况下，这些版本并存于我们的计算机上。

如下所示：
```
binzo@binzo-acer-ubt:~/myshell_git/myshell/python$ ls /usr/bin/python
python             python2.7-config   python3.5          python3.5m-config
python2            python2-config     python3.5-config   python3m
python2.7          python3            python3.5m         python-config
```

## 默认 Python 版本

虽然有那么多个版本，但是系统会有一个默认 Python 版本，先让我们查看下当前版本，如下：
```
binzo@binzo-acer-ubt:~$ python --version
Python 2.7.12
```
那为什么默认是 2.7，而不是其它呢？再看：
```
binzo@binzo-acer-ubt:~$ which python
/usr/bin/python
binzo@binzo-acer-ubt:~$ ll /usr/bin/python
lrwxrwxrwx 1 root root 9 Jul 10  2016 /usr/bin/python -> python2.7*
```
可以看到 python 命令链接到的是 python2.7，当然，我们可以更改文件链接到其它版本的 Python 可执行文件，但是这样并不那么方便，也不那么安全。

既然有多个版本，我们怎样才能自由切换呢？

## virtualenvwrapper

virtualenvwrapper 可以实现多个版本之间的轻松切换

安装可以使用以下命令：
```
sudo apt install python-pip
sudo pip install virtualenvwrapper
```

## pip

安装完 python-pip 以后，我们可以查看以下 pip 的版本号，和存储路径：
```
binzo@binzo-acer-ubt:~$ pip --version
pip 8.1.2 from /usr/local/lib/python2.7/dist-packages (python 2.7)
```

可以看到 pip 的路径在 python2.7 下，所以，我们可以理解为，当前的这个 pip 是基于 python2.7 的工具。

并且，我们使用这个 pip 安装了 virtualenvwrapper。

## source virtualenvwrapper.sh

我一般会把这个脚本，写入 ~/.bashrc 中，写入内容如下：
```
# python
VIR_ENV_SH="/usr/local/bin/virtualenvwrapper.sh"
if [ -f "${VIR_ENV_SH}" ]; then
    source ${VIR_ENV_SH}
fi
```
这个脚本中有切换 Python 版本的一些常用命令：
```
  # 创建虚拟环境
  mkvirtualenv env --python=PYTHON_EXE  # PYTHON_EXE 比如：/usr/bin/python3.5

  # 切换虚拟环境
  workon env

  # 取消激活状态
  deactivate

  # 删除虚拟环境
 rmvirtualenv env
```

## 切换到 Python3.5

```
binzo@binzo-acer-ubt:~$ workon env35
(env35) binzo@binzo-acer-ubt:~$ python --version
Python 3.5.1+
(env35) binzo@binzo-acer-ubt:~$ pip --version
pip 8.1.2 from /home/binzo/.virtualenvs/env35/lib/python3.5/site-packages (python 3.5)
```
当切换到 Python3.5 之后，可以看到 Python 和 Pip 的版本都发生了变化。

比如，我们现在可以使用 Python3.5 的 Pip 来安装相应组件：
```
(env35) binzo@binzo-acer-ubt:~$ pip install shadowsocks
```

## 结语

至此，应该对 Python、Pip 有一个基本的了解了。

最后祝：玩得愉快




