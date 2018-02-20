package xyz.albertgao.app

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView
import xyz.albertgao.libs.Sample

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val textView = findViewById<TextView>(R.id.myTextView)
        textView.text = Sample().checkPlatform()
    }
}
