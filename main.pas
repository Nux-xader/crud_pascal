PROGRAM kode_matakuliah;
// Program pendataan sederhana

uses
	crt;

// type
// 	matakuliah=record

var
	// vr: matakuliah;
	data: string;
	i, choice, jumlah_pinjaman: integer;
	x: integer=0;
	num: integer;
	no_pinjaman, nama_anggota, kode_pinjaman, jenis_pinjaman, tingkat_bunga, lama_pinjaman, jumlah_anggaran: string;
	tipe_data: Text;

BEGIN
	Assign(tipe_data,'data.dat');
	{$I-}
		Reset(tipe_data);
	{$I+}
	While not eof (tipe_data) do
		Begin
		Readln(tipe_data, data);
		x:= x+1;
		End;
	Close(tipe_data);
	while (true) do
		begin
		clrscr;
		writeln('MENU PROGRAM');
		writeln('------------');
		writeln('[1] ENTRY');
		writeln('[2] LAPORAN');
		writeln('[4] EXIT');
		write('INPUT PILIHAN[1-3]: ');
		readln(choice);
		if (choice = 1) then
			begin
			Assign(tipe_data,'data.dat');
			Append(tipe_data);
			x:= x+1;
			clrscr;
			writeln('ENTRY Data Pinjaman Koprasi');
			writeln('---------------------------');
			write('No. Pinjaman      : ');readln(no_pinjaman);
			write('Nama Anggota      : ');readln(nama_anggota);
			write('Kode Pinjaman[A/B]: ');readln(kode_pinjaman);
			write('Jumlah Pinjaman   : ');readln(jumlah_pinjaman);
			jenis_pinjaman:='-';
			tingkat_bunga:='-';
			jumlah_pinjaman:='-';
			if (upcase(kode_pinjaman)='A') then
				begin
				jenis_pinjaman:='Konsumtif';
				tingkat_bunga:='15%';
				jumlah_anggaran:=1.8*jumlah_pinjaman;
				end;
			if (upcase(kode_pinjaman)='B') then
				begin
				jenis_pinjaman:='Modal';
				tingkat_bunga:='10%';
				jumlah_anggaran:=jumlah_pinjaman;
				end;
			write('Lama Pinjaman     :');readln(lama_pinjaman);
			write('Tanngal Pinjaman  : ');readln(tingkat_bunga);
			write('SIMPAN DATA[Y/T]  : ');readln;
			write('TAMBAH DATA[Y/T]  : ');readln;
			Writeln(tipe_data,'|',x,' | ',no_pinjaman:12,' | ',nama_anggota:12,' | ',kode_pinjaman:13,' | ',jenis_pinjaman:12,' | ',tingkat_bunga:12,' | ',jumlah_pinjaman:12,' | ',lama_pinjaman:12,' | ',jumlah_pinjaman:12, '|');
			Writeln;
			Close(tipe_data);
			write('[Press Enter to Continue]');
			readln;
			end;

		if (choice = 2) then
			begin
			Assign(tipe_data,'data.dat');
			{$I-}
				Reset(tipe_data);
			{$I+}
			clrscr;
			writeln('                          LAPORAN');
			writeln('-------------------------------------------------------------------------------------------------------------------------------------');
			writeln('|NO| No. Pinjaman | NAMA Anggota | Kode Pinjaman | Jenis Pinjaman | Tingkat Bunga | Jumlah Pinjaman | Lama Pinjaman | Jumlah Anggaran|');
			writeln('-------------------------------------------------------------------------------------------------------------------------------------');
			While not eof (tipe_data) do
				Begin
				Readln(tipe_data, data);
				Writeln(data);
				End;
			writeln('--------------------------------------------------------------------------------------------------------------------------------------');
			Close(tipe_data);
			write('[Press Enter to Continue]');
			readln;
			end;

		if (choice = 3) then
			begin
			clrscr;
			writeln('Program keluar terimakasih:)');
			break;
			end;

		if (choice > 3) then
			begin
			write('Wrong input [Press Enter to Continue]');
			readln;
			end;
		end;
END.