<?php
// 应用公共文件
use app\common\service\FileService;

/**
 * @notes 生成密码加密密钥
 * @param string $plaintext
 * @param string $salt
 * @return string
 * @author 段誉
 * @date 2021/12/28 18:24
 */
function create_password(string $plaintext, string $salt) : string
{
    return md5($salt . md5($plaintext . $salt));
}


/**
 * @notes 随机生成token值
 * @param string $extra
 * @return string
 * @author 段誉
 * @date 2021/12/28 18:24
 */
function create_token(string $extra = '') : string
{
    return md5($extra . time());
}


/**
 * @notes 截取某字符字符串
 * @param $str
 * @param string $symbol
 * @return string
 * @author 段誉
 * @date 2021/12/28 18:24
 */
function substr_symbol_behind($str, $symbol = '.') : string
{
    $result = strripos($str, $symbol);
    if ($result === false) {
        return $str;
    }
    return substr($str, $result + 1);
}


/**
 * @notes 对比php版本
 * @param string $version
 * @return bool
 * @author 段誉
 * @date 2021/12/28 18:27
 */
function compare_php(string $version) : bool
{
    return version_compare(PHP_VERSION, $version) >= 0 ? true : false;
}


/**
 * @notes 检查文件是否可写
 * @param string $dir
 * @return bool
 * @author 段誉
 * @date 2021/12/28 18:27
 */
function check_dir_write(string $dir = '') : bool
{
    $route = root_path() . '/' . $dir;
    return is_writable($route);
}


/**
 * 多级线性结构排序
 * 转换前：
 * [{"id":1,"pid":0,"name":"a"},{"id":2,"pid":0,"name":"b"},{"id":3,"pid":1,"name":"c"},
 * {"id":4,"pid":2,"name":"d"},{"id":5,"pid":4,"name":"e"},{"id":6,"pid":5,"name":"f"},
 * {"id":7,"pid":3,"name":"g"}]
 * 转换后：
 * [{"id":1,"pid":0,"name":"a","level":1},{"id":3,"pid":1,"name":"c","level":2},{"id":7,"pid":3,"name":"g","level":3},
 * {"id":2,"pid":0,"name":"b","level":1},{"id":4,"pid":2,"name":"d","level":2},{"id":5,"pid":4,"name":"e","level":3},
 * {"id":6,"pid":5,"name":"f","level":4}]
 * @param array $data 线性结构数组
 * @param string $symbol 名称前面加符号
 * @param string $name 名称
 * @param string $id_name 数组id名
 * @param string $parent_id_name 数组祖先id名
 * @param int $level 此值请勿给参数
 * @param int $parent_id 此值请勿给参数
 * @return array
 */
function linear_to_tree($data, $sub_key_name = 'sub', $id_name = 'id', $parent_id_name = 'pid', $parent_id = 0)
{
    $tree = [];
    foreach ($data as $row) {
        if ($row[$parent_id_name] == $parent_id) {
            $temp = $row;
            $child = linear_to_tree($data, $sub_key_name, $id_name, $parent_id_name, $row[$id_name]);
            if($child){
                $temp[$sub_key_name] = $child;
            }
            $tree[] = $temp;
        }
    }
    return $tree;
}


/**
 * @notes 删除目标目录
 * @param $path
 * @param $delDir
 * @return bool|void
 * @author 段誉
 * @date 2022/4/8 16:30
 */
function del_target_dir($path, $delDir)
{
    //没找到，不处理
    if (!file_exists($path)) {
        return false;
    }

    //打开目录句柄
    $handle = opendir($path);
    if ($handle) {
        while (false !== ($item = readdir($handle))) {
            if ($item != "." && $item != "..") {
                if (is_dir("$path/$item")) {
                    del_target_dir("$path/$item", $delDir);
                } else {
                    unlink("$path/$item");
                }
            }
        }
        closedir($handle);
        if ($delDir) {
            return rmdir($path);
        }
    } else {
        if (file_exists($path)) {
            return unlink($path);
        }
        return false;
    }
}


/**
 * @notes 下载文件
 * @param $url
 * @param $saveDir
 * @param $fileName
 * @return string
 * @author 段誉
 * @date 2022/9/16 9:53
 */
function download_file($url, $saveDir, $fileName)
{
    if (!file_exists($saveDir)) {
        mkdir($saveDir, 0775, true);
    }
    $fileSrc = $saveDir . $fileName;
    file_exists($fileSrc) && unlink($fileSrc);
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
    $file = curl_exec($ch);
    curl_close($ch);
    $resource = fopen($fileSrc, 'a');
    fwrite($resource, $file);
    fclose($resource);
    if (filesize($fileSrc) == 0) {
        unlink($fileSrc);
        return '';
    }
    return $fileSrc;
}


/**
 * @notes 去除内容图片域名
 * @param $content
 * @return array|string|string[]
 * @author 段誉
 * @date 2022/9/26 10:43
 */
function clear_file_domain($content)
{
    $fileUrl = FileService::getFileUrl();
    return str_replace($fileUrl, '/', $content);
}


/**
 * @notes 设置内容图片域名
 * @param $content
 * @return array|string|string[]|null
 * @author 段誉
 * @date 2022/9/26 10:43
 */
function get_file_domain($content)
{
    $preg = '/(<img .*?src=")[^https|^http](.*?)(".*?>)/is';
    $fileUrl = FileService::getFileUrl();
    return preg_replace($preg, "\${1}$fileUrl\${2}\${3}", $content);
}

function issetNotEmpty ($var) {
    return (isset($var) && $var);
}

function showme ($var) {
    echo '<pre>';
    print_r($var);
    echo '</pre>';
}
