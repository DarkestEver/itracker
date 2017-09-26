	
	<?php 
 error_reporting(E_ALL);
require_once ("php-mysql/MysqliDb.php");

 $root = $_SERVER['DOCUMENT_ROOT'];
 $installationDir = "";
 
 if (isset($_SESSION['user'])){
     $userid =(int)$_SESSION['user']['id'];
	}


//$json = json_decode(file_get_contents($root."/".$installationDir."/admin/dbconf.json"),TRUE);

	/*$db = new MysqliDb (Array (
						'host' =>  'localhost',
						'username' =>  'tovuser',
						'password' => 'iOr55^v9',
						'db' => 'tigertim_tov',
						'port' =>  '3306'
						
						));*/
						
					
	$db = new MysqliDb (Array (
						'host' =>  'localhost',
						'username' =>  'root',
						'password' => '',
						'db' => 'itrack',
						'port' =>  '3306'
						
						));
	 function cleanText($data) {
	  $data = trim($data);
	  $data = stripslashes($data);
	  $data = htmlspecialchars($data);
	  return $data;
	}


function createjson ($str)
{
return "'[". substr( $str ,0 , strlen($str) - 1  )."]'";
}
//////////////////////////////////////////////////////////////////////////

 function getTagDropdown()
	 {
		 global $db ; global $userid;
		 
		 $result = $db->get("tags");
		 $s = '';
		 foreach ($result as $types)
		 {
		 	
		 	$s .= "<option value='".$types['id']."'>" .    $types['tagname']. "</option>";
		 	
		 }
		 return  $s ;
		 	
	 }

 function getProjectDropdown()
	 {
		 global $db ; global $userid;
		 $db->where("status","1");
		 $result = $db->get("projects");
		 $s = '';
		 foreach ($result as $types)
		 {
		 	
		 	$s .= "<option value='".$types['projectid']."'>" .    $types['projectid'].'-'. $types['projectname']. "</option>";
		 	
		 }
		 return  $s ;
		 	
	 }

function inserttrack($description, $projectid, $starttime, $stoptime, $tagisd )
	 {
	 		   global $db ;global $userid;
			 /*  $data = Array (
			   "description" => $description,
			   "projectid" => $projectid,
               "starttime" => $starttime,
               "stoptime" => $stoptime,
               "userid" => $userid,
               "tagsid" => $tagisd,
               "createddate" => date('Y-m-d H:i:s')
				);
				
*/
				$id = $db->rawQuery('call usp_insert_track11("'.$description.'","'. $projectid.'",'.$tagisd .',"'. $starttime .'","'. $stoptime .'",'.$userid.')');
				if($id)
					return "1";
				else
					return $db->getLastError();
	 }

	 function getTract($date1)
	{
			global $db ;global $userid;
			$db->orderBy("starttime","asc");
			$db->orderBy("stoptime","asc");
			$db->where("userid",$userid);
			$db->where('starttime',  array( date($date1 ." 00:00:00"),  date($date1 ." 23:59:59")) , 'BETWEEN');
			$jsload = $db->get("view_tracking");
			return $jsload;
	}



function validateDate($date, $format = 'Y-m-d')
{
    $d = DateTime::createFromFormat($format, $date);
    return $d && $d->format($format) == $date;
}
function timeToSeconds($time) {
    $arr_time = explode(':',$time);
    return $arr_time[0] * 3600 + $arr_time[1] * 60 ;
}
function timeToMinutes($time) {
    $arr_time = explode(':',$time);
    return (($arr_time[0] * 3600 + $arr_time[1] * 60 )/60);
}

function trackstatus($stats)
{
	
	if ($stats == 1)
	{
		return "fa fa-play";
	}
	else if ($stats == 2)
	{
		return "fa fa-pause";
	} 
	else if ($stats == 3)
	{
		return "fa fa-stop";
	} 
}

////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////


	function getTCong()
	{
			global $db ;global $userid;
			$db->where("userid",$userid);
			$jsload = $db->get("config");

			return $jsload;
	}
	///////////////// user ///////////////////////////
	function userExists($username)
	{
			global $db ;
			$db->where("USERNAME",$username);
			$pass = $db->getOne("users");
			return $pass;
	}
	function userlogin($username,$password)
	{
			global $db ;
			$db->where("USERNAME",$username);
			$db->where("password",$password);
			$pass = $db->getOne("users");
			return $pass;
	}
	 function userregisteration($uname,$emailid,$password)
	 {
			   global $db ;
			   $data = Array (
			   "name" => $uname,
			   "USERNAME" => $emailid,
			   "password" => $password,
               "usertype" => '1',
               "registerDate" => date('Y-m-d H:i:s'),
			   "lastvisitDate" => date('Y-m-d H:i:s'),
               "activation" => 0
				);
				$id = $db->insert ('users', $data);
				if($id)
					return $id;
				else
					0;
	 }


////////config////////

	 function updateConfigs($id,$val,$status)
	 {
		 global $db ;global $userid;
			   $data = Array (
               "congvalues" => $val,
               "status" => $status,
                "userid" => $userid,
               
			   "modifiedon" => date('Y-m-d H:i:s')

				);
		$db->where ('id', $id);
		if ($db->update ('config', $data))
			 return 1;
		 else
			 return 0;
	 }

	function deleteById($id,$tableName)
	 {
		 global $db ;global $userid;
		 $db->where('id', $id);
		 $db->where ('userid', $userid);
		 if($db->delete($tableName))
			 return true;
		 else
			 return false;
	 }

	function keyPairValue($tableName, $keyCol, $valCol)
	 {
		 $keyPairArray = array();
		 global $db ;global $userid;
		 $congifs = getCmdCong();
		 foreach ($congifs as $congif)
		 {
			 $keyPairArray[$congif[$keyCol]] = $congif[$valCol];
		 }
		 return $keyPairArray;
	 }
	
?>