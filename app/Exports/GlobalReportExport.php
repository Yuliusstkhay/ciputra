<?php

namespace App\Exports;

use App\Models\PenilaianHeader;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class GlobalReportExport implements FromView, WithColumnWidths,WithStyles {


    protected $data;

    function __construct($data) {
        $this->data = $data;
    }

    public function view(): View {
        return view('laporan.global.excel', [
            'data' => $this->data
        ]);
    }

    public function columnWidths(): array {
        return [
            'B' => 20,            
            'C' => 20,            
            'D' => 20,            
            'E' => 20,            
            'G' => 20,            
        ];
    }

    public function styles(Worksheet $sheet) {
        

        return [
            // Styling a specific cell by coordinate.
            'B3' => ['font' => ['bold' => true,'size' => 18]],
        ];
    }

}
