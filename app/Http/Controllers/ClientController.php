<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Movie;
use App\Models\Snack;

class ClientController extends Controller
{
    /**
     * Muestra el dashboard del cliente.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        // Obtén todas las películas disponibles
        $movies = Movie::all();

        // Obtén todos los snacks disponibles
        $snacks = Snack::all();

        // Retorna la vista con las películas y snacks
        return view('client.dashboard', [
            'movies' => $movies,
            'snacks' => $snacks
        ]);
    }
}
