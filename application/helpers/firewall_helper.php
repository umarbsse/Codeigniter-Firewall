<?php
    insert_login_logs_record();
    function load_view($view_path,$data){
        $file_name = $view_path;
        $file_path = view_file_path($file_name);
        if ( ! file_exists($file_path)){
            show_404();
            die();
        }
        $ci = &get_instance();
        $data = $ci->security->xss_clean($data);
        $ci->load->view($file_name,$data);
    }
    function view_file_path($filename=NULL){
        $file = "";
        if ($filename!=NULL){
            $file = APPPATH.'views/'.$filename.'.php';

        }
        return $file;
    }
    function insert_login_logs_record(){
        $ci = &get_instance();
        $array = get_user_agent_date();
        $array['ip']=get_real_ip();
        $array['added_on']=get_current_time();
        $ci->firewall_model->insert_record('firewall_logs', $array);
    }
    function get_user_agent_date(){

        $ci = &get_instance();

        $ci->load->library("user_agent");

        $data['platform'] = $ci->agent->platform();

        $data['browser'] = $ci->agent->browser();

        $data['version'] = $ci->agent->version();

        $data['mobile'] = $ci->agent->mobile();

        $data['robot'] = $ci->agent->robot();

        $data['referrer'] = $ci->agent->referrer();

        $data['full_url'] = getCurrentUrl();
        $temp = get_class__method_name();
        $data['base_url'] = base_url();
        $data['controller_url'] = $temp['controller'];
        $data['method_url'] = $temp['method'];
        $data['agent_string'] = $ci->agent->agent_string();
        return $data;
    }
    function get_real_ip(){

        if (!empty($_SERVER['HTTP_CLIENT_IP']))   //check ip from share internet

        {

        $ip=$_SERVER['HTTP_CLIENT_IP'];

        }

        elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))   //to check ip is pass from proxy

        {

        $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];

        }

        // check if isset REMOTE_ADDR and != empty

        elseif(isset($_SERVER['REMOTE_ADDR']) && ($_SERVER['REMOTE_ADDR'] != '') && ($_SERVER['REMOTE_ADDR'] != NULL))

        {

            $ip = $_SERVER['REMOTE_ADDR'];

        // you're probably on localhost

        } else {

        $ip = "127.0.0.1";

        }

        return $ip;
    }

    function getCurrentUrl() {

         $pageURL = 'http';

         if (isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on") {$pageURL .= "s";}

         $pageURL .= "://";

         if ($_SERVER["SERVER_PORT"] != "80" && $_SERVER["SERVER_PORT"] != "443" ) {

             $pageURL .=

             $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];

         }

         else {

             $pageURL .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];

         }

         return $pageURL;

    }

    function get_current_time($formate=NULL){

        if ($formate==NULL) {

            return date("Y-m-d H:i:s");

        }

        return date($formate);

    }

    function get_class__method_name(){
        $array = array();

        $ci = &get_instance();

        $array['controller'] = $ci->router->fetch_class();

        $array['method'] = $ci->router->fetch_method();

        return $array;

    }
    function print_arr($array){

        echo "<pre>";print_r($array);echo "</pre>";

    }
?>