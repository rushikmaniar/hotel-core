<?php
/**
 * Created by PhpStorm.
 * User: rushikwin8
 * Date: 003 03-09-2018
 * Time: 12:33 PM
 */?>

<nav class="navbar navbar-expand-md navbar-dark bg-light">
    <div class="container">
        <a class="navbar-brand" href="<?= base_url; ?>">Minute Masti</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse navbar-light" id="navbarsExample05">
            <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
                <li class="nav-item">
                    <a class="nav-link active" href="<?= base_url; ?>">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="<?= base_url; ?>rooms.php" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Rooms</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="<?= base_url; ?>rooms.php">Room Videos</a>
                        <a class="dropdown-item" href="<?= base_url; ?>rooms.php">Presidential Room</a>
                        <a class="dropdown-item" href="<?= base_url; ?>rooms.php">Luxury Room</a>
                        <a class="dropdown-item" href="<?= base_url; ?>rooms.php">Deluxe Room</a>
                    </div>

                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?= base_url; ?>blog.php">Blog</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?= base_url; ?>about.php">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?= base_url; ?>contact.php">Contact</a>
                </li>

                <li class="nav-item cta">
                    <a class="nav-link" href="<?= base_url; ?>booknow.php"><span>Book Now</span></a>
                </li>
            </ul>

        </div>
    </div>
</nav>
