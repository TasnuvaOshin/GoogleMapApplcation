package com.khudrosoft.myapplication.Distance;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.pm.PackageManager;
import android.location.Location;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.khudrosoft.myapplication.MyMap.MapActivity;
import com.khudrosoft.myapplication.R;


import static com.khudrosoft.myapplication.MyMap.MapActivity.MY_PERMISSIONS_REQUEST_LOCATION;

public class CalculateDistance extends AppCompatActivity implements OnMapReadyCallback,GoogleMap.OnMarkerClickListener,GoogleMap.OnMarkerDragListener {
    private static final float DEFAULT_ZOOM = 15f;
    GoogleMap gMap;
    private Button bDistance;
    private FusedLocationProviderClient fusedLocationProviderClient;
    private Location location;
    private Double StartLang,StartLong,EndLang,EndLong;

    /*
    dont use emulator for test , use real device
    author : tasnuva
     */
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calculate_distance);
        bDistance = findViewById(R.id.distance);


         //for map Setting
        SupportMapFragment  supportMapFragment = (SupportMapFragment) getSupportFragmentManager().findFragmentById(R.id.map);
        supportMapFragment.getMapAs