Sub Initialize()
  gForm.Controls("Botonera").activarScripts = True
  gForm.grdLineas.ActivarScripts = True

End Sub


Sub Show()
  gForm.grdLineas.ActivarScripts = True
  gForm.Controls("grdLineas").AgregaColumna "@Gama", 1000, "Gama"
  gForm.Controls("grdLineas").AgregaColumna "IdPedido", 0, "IdPedido"
  gForm.Controls("grdLineas").AgregaColumna "IdLinea", 0, "IdLinea"
  
  If gForm.Controls("grdLineas").existecolumna ("@Gama") Then
     gForm.Controls("grdLineas").campo("@Gama").Column.Order = 2
     gForm.Controls("grdLineas").campo("@Gama").Sustitucion = "select descrip from pedidos_cli_lineasubic pc inner join  pers_colores p on p.idcolor = pc.p1 where idpedido = @idpedido and idlinea = @idlinea"
  End If
  
  gForm.Controls("grdLineas").refrescar
End Sub


Sub Botonera_BeforeExecute(aBotonera, aBoton, aCancel)

  If aBotonera.Name = "Botonera" Then
    If aBoton.Name = "botGenerar" Then
      
	'Recoger el grid para copiar el idDoc de las lineas en una tabla temporal
	Set lgrd = gForm.Controls("grdLineas")
	Set lArr = lgrd.ArrayDb

	Dim i
	For i = lArr.Lowerbound (1) To lArr.UpperBound(1)
	  If larr(i, lgrd.colindex("Sel")) < 0 Then
	    IdPedido = larr(i, lgrd.colindex("IdPedido"))
	    IdLinea = larr(i, lgrd.colindex("IdLinea"))
	    IdDoc = gcn.damevalorcampo("SELECT IdDoc FROM Pedidos_Cli_Lineas WHERE IdPedido = "&IdPedido&" And IdLinea = "&IdLinea&"")
	    
	    'Insertar en la tabla temp
	    lSql = "insert into Pers_Temp_IdDoc_LineasFacturasRec(Id_IdDoc) values ("&IdDoc&")" 
      
          If Not gcn.executeSql(CStr(lSql),,,,False) Then          
            MsgBox "Error insertando en Pers_Temp_IdDoc_LineasFacturasRec"
            MsgBox gcn.DameTodosLosErrores,vbcritical,"Error"
            Exit Sub
        End If 
	    
	  End If
	Next
	aCancel = True
    End If
  End If

End Sub



'Para Activar este evento hay que configurar la grid. Poner en el sub Initialize por ejemplo: gForm.grdLineas.ActivarScripts = True
'Este evento se ejecuta cada vez que se recarga la grid
Sub Grid_AfterLoad(aGrid)

  If aGrid.existecolumna ("@Gama") Then
     aGrid.campo("@Gama").Column.Order = 2
  End If

End Sub
