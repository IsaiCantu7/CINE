<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    use HasFactory;

    // Los atributos que son asignables en masa.
    protected $fillable = [
        'movie_id',
        'quantity',
        'showtime',
        'seats',
        'showdate',
        'snacks',
    ];

    // Definir la relación con la película.
    public function movie()
    {
        return $this->belongsTo(Movie::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'id'); // Ajusta 'user_id' si tu clave foránea es diferente
    }
    
}
