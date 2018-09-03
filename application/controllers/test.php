<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use ElephantIO\Client;
use ElephantIO\Engine\SocketIO\Version1X;
require __DIR__.'\vendor\autoload.php';

class Test extends CI_Controller {

	public function index()
	{
		$msg     = array();
		$msg["output"]          = array();
		$msg["sendertype"]      = 1;
		$msg["topicid"]         = 29;
		$msg["user"]              = 'lenna';
		$msg["islive"]          = 1;
		$msg["output"][]        = array("type"=>"text","text"=>'kirim',"speak"=>'kirim');
		$client = new Client(new Version1X("https://dev.lenna.id:3000", ['context' => ['ssl' => ['verify_peer_name' =>false, 'verify_peer' => false]]]));
		$client->initialize();
          $client->emit('new_message', ['data' => json_encode($msg)]);
          $client->close();
	}

}

/* End of file test.php */
/* Location: ./application/controllers/test.php */