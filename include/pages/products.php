Turs

<?php 
if (!empty($site_user)) {
  $host = '127.0.0.1';
  $db   = 'site';
  $charset = 'utf8mb4';

  $dsn = "mysql:host=$host;dbname=$db;charset=$charset";

  $user = 'db_user';
  $pass = 'pass';

  $options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
  $options[PDO::ATTR_DEFAULT_FETCH_MODE] = PDO::FETCH_ASSOC;
  $options[PDO::ATTR_EMULATE_PREPARES] = false;

  try {
    $pdo = new PDO($dsn, $user, $pass, $options);
  } catch (PDOException $e) {
    throw new PDOException($e->getMessage(), (int)$e->getCode());
  }

  $sql = 'SELECT * FROM cont';

  $result = $pdo->query($sql);

  $page = "home";
  $page_data;

  // if (isset($_GET['p'])) {
  echo '<a href="?p=' . $page . '&logout">Logout</a>';
  if ($result->rowCount()) {

    while ($row = $result->fetch()) {
      echo "<div id='product'> <img src = " . $row["image"] . "> <h1>id: " . $row["id"] . "</h1>  - <h2>Name: " . $row["title"] .  "</h2></div> <br>";
    }
  } else {
    echo "0 results";
  }
} else {
  echo "<div>You must be logged in to browse our products</div>";

  include('include/pages/login.php');
}

?> 